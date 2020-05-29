layoutname()
{
	echo $(xrandr | grep -w "connected" | cut -d " " -f 1 | sort | tr "\n" ":")
}
