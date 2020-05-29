layoutname()
{
	echo $(xrandr | grep -w "connected" | cut -d " " -f 1 | tr "\n" ":")
}
