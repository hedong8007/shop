for i in $(ls `pwd`|awk '/.*?jp.*?g/')
do
	echo $i
	convert -resize  485x455! $i $i
done
echo "裁剪成功"
