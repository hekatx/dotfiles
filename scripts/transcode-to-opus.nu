#!/usr/bin/env nu
ls ...(glob **/*.{mp3,flac,wav,m4a,aac})
| each {|file| 
    let output = ($file.name | path parse | update extension "opus" | path join)
    print $"converting ($file.name)..."
    ffmpeg -i $file.name -c:a libopus -b:a 128k $output
}
