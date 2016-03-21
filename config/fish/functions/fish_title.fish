function fish_title
	if [ $_ = 'fish' ]
        echo (prompt_pwd)
    else
        echo $_ (prompt_pwd)
    end
end
