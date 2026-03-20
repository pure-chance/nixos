# capture environment variables in foreign shell scripts
def capture-foreign-env [
    --shell (-s): string = /bin/sh
    # The shell to run the script in
    # (has to support '-c' argument and POSIX 'env', 'echo', 'eval' commands)
    --arguments (-a): list<string> = []
    # Additional command line arguments to pass to the foreign shell
] {
    let script_contents = $in;
    let env_out = with-env { SCRIPT_TO_SOURCE: $script_contents } {
        ^$shell ...$arguments -c `
        env
        echo '<ENV_CAPTURE_EVAL_FENCE>'
        eval "$SCRIPT_TO_SOURCE"
        echo '<ENV_CAPTURE_EVAL_FENCE>'
        env -u _ -u _AST_FEATURES -u SHLVL` # Filter out known changing variables
    }
    | split row '<ENV_CAPTURE_EVAL_FENCE>'
    | {
        before: ($in | first | str trim | lines)
        after: ($in | last | str trim | lines)
    }

    # Unfortunate Assumption:
    # No changed env var contains newlines (not cleanly parseable)
    $env_out.after
    | where { |line| $line not-in $env_out.before } # Only get changed lines
    | parse "{key}={value}"
    | transpose --header-row --as-record
}

# yazi wrapper --
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

# # typst watch --
# def typst-watch [file] {
#   let output_pdf = $file | str replace -r '(.+).typ' '$1.pdf'
#   typst watch $file $output_pdf --open --root=./
# }

# config shortcuts --
def --env cf [dir?] {
  if $dir != null {
    let path = $env.CONFIG_HOME | path join $dir
    if ($path | path exists) {
      hx $path
    } else {
      echo "directory does not exist"
    }
    return
  }
  cd $env.CONFIG_HOME
}

# show / hide dekstop icons --
def desktop-icons [show: bool] {
  if $show {
    echo "Showing desktop icons (this might take up to a few minutes)"
    defaults write com.apple.finder CreateDesktop -bool true
    killall Finder
  } else {
    echo "Hiding desktop icons"
    defaults write com.apple.finder CreateDesktop -bool false
    killall Finder
  }
}


# miscellaneous --

def rand-book [] {
    let book_file_name = ls | shuffle | first | get name
    echo $book_file_name
    epy $book_file_name
}

# FIXME: this still isn't robust in getting the best video (that's also compatible with mac QuickTime Player)
def yt-dl [url: string] {
    yt-dlp -P '~/videos' -o '%(title)s [%(id)s].%(ext)s' --verbose -S "res:720" -f "bv*[height<=1080]+ba*[ext=m4a]" --write-thumbnail --convert-thumbnails jpg --write-subs --sub-langs all,-live_chat --no-write-auto-subs --convert-subs srt --remux-video mp4 --embed-subs --embed-metadata --no-overwrites --concurrent-fragments 4 $url
}
