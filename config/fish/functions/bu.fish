function bu
    if test (uname) != "Darwin"
        echo "bu: Homebrew is only available on macOS"
        return 1
    end

    brew update
    brew upgrade --greedy
    brew cleanup
    # brew doctor
end
