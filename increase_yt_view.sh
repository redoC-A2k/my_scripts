# This script works by refreshing the browser as  if you yourself watching video , this script also does some switching by pressing 1,2 ... or 9 to switch to different parts of video
# If you want to use this script to increase your views for youtube and earn , then this just adds your own view not viewed by other people and youtube considers views by others too for payment
# If you want to use this make sure to install xdotool firefox wmctrl and then change youtube url with the yt video you want to increase view and the title of that video
# This scipt opens firefox browser window on first run with your youtube video you want to increase views of (please don't open any tab on this window as I am only able to select window based on title and the title of firefox is the title of webpage which in this case would be title of your youtube video) so if you want to do some browsing then open other browser like chrome or brave so that it won't get interfer by this script

# This script assumes you are connected to internet .
# This script assumes you are using a ad blocker like u-block-origin so that ad doesn't comes on youtube page
# This script assumes you are using linux and not on windows , If you make a script inspiring from my work make sure to put that here too .

#----------- I am not responsible if your video gets removed from youtube or your channel gets deleted from youtube use on your own responsiblity -----


switchto=9
playfor_min="30"
playfor_max="60"
actionafter_max="10"
actionafter_min="3"
wait_for_video_to_load="2"
yt_url="https://www.youtube.com/watch?v=x5Nn9ACJ0vk"
yt_video_title="Synchronization , thread communication , thread group in java - YouTube — Mozilla Firefox"
actions=()
get_win_id() {
  win_id=$(wmctrl -l | grep "$yt_video_title"  | cut -d " " -f1 )
  if [[ $win_id == "" ]]; then
    firefox --new-window $yt_url &
    sleep 60s #wait for 1min for firefox to start
    win_id=$(wmctrl -l | grep "$yt_video_title" | cut -d " " -f1 )
  fi
   win_id=$(echo $win_id | cut -d "x" -f2)
   win_id=$((16#$win_id))
  echo $win_id
}

get_stack_no() {
  wins_in_stack=$(xdotool search --role browser)
  # echo $wins_in_stack>/dev/pts/2
  declare -i i=0
  for win in $wins_in_stack ; do
    i=$i+1
    if [[ $win -eq $1 ]]; then
      break
    fi
  done
  echo $i
}

while [[ 1 ]]; do
  win_id=$(get_win_id)
  stack_no=$(get_stack_no $win_id)
  echo "%$stack_no"
  xdotool search --role browser key --window "%$stack_no" ctrl+r
  sleep $wait_for_video_to_load # waiting for video to load
  xdotool search --role browser key --window "%$stack_no" space #start playing video 
  time_to_play=$(($playfor_min+$(($RANDOM%$playfor_max))))
  echo "will play for time $time_to_play"
  SECONDS=0
  while [[ 1 ]]; do
    time_to_action=$(($actionafter_min+$(($RANDOM%$actionafter_max))))
    rand_switch_to=$(($RANDOM%$switchto))
    xdotool search --role browser key --window "%$stack_no" $rand_switch_to 
    echo "$SECONDS and time to play $time_to_play\n"
    if [[ $SECONDS -gt $time_to_play ]]; then
      break
    fi
    echo "going to sleep before action\n"
    sleep $time_to_action
  done
  echo "played for given time"
done
