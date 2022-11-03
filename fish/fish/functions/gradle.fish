function gradle
  if test -f "./gradlew"
    ./gradlew $argv
  else
    command gradle $argv
  end
end
