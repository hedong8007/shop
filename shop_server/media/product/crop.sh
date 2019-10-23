for i in $(ls `pwd`|awk '/.*?jp.*?g/')
do
	echo $i
	convert -resize  100x84! $i $i
done
echo "裁剪成功"
