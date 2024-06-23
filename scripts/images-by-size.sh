#!/bin/sh

all_images() {
    find . -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.webp' -o -name '*.gif' -o -name '*.mp4'
}

all_images_with_size() {
    all_images | while read -r path; do
	width="$(file "$path" | awk -F', ' '{print $2}')"
	printf "%s : %s\n" "$width" "$path"
    done
}

all_images_with_size | sort -rn
