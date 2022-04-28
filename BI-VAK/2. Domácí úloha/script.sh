rm tmp*
./a.out < Tests/in01.txt >> tmp1

if cmp -s -- tmp1 Tests/out01.txt ; then
    echo "Files are equal!"
    rm tmp1
else
    echo "Files out01.txt and tmp missmatch!"
fi

./a.out < Tests/in02.txt >> tmp2
if cmp -s -- tmp2 Tests/out02.txt ; then
    echo "Files are equal!"
    rm tmp2
else
    echo "Files out02.txt and tmp missmatch!"
fi

./a.out < Tests/in03.txt >> tmp3
if cmp -s -- tmp3 Tests/out03.txt ; then
    echo "Files are equal!"
    rm tmp3
else
    echo "Files out03.txt and tmp missmatch!"
fi

./a.out < Tests/in04.txt >> tmp4
if cmp -s -- tmp4 Tests/out04.txt ; then
    echo "Files are equal!"
    rm tmp4
else
    echo "Files out04.txt and tmp missmatch!"
fi

./a.out < Tests/in05.txt >> tmp5
if cmp -s -- tmp5 Tests/out05.txt ; then
    echo "Files are equal!"
    rm tmp5
else
    echo "Files out05.txt and tmp missmatch!"
fi

./a.out < Tests/in06.txt >> tmp6
if cmp -s -- tmp6 Tests/out06.txt ; then
    echo "Files are equal!"
    rm tmp6
else
    echo "Files out06.txt and tmp missmatch!"
fi

./a.out < Tests/in07.txt >> tmp7
if cmp -s -- tmp7 Tests/out07.txt ; then
    echo "Files are equal!"
    rm tmp7
else
    echo "Files out07.txt and tmp missmatch!"
fi

./a.out < Tests/in08.txt >> tmp8
if cmp -s -- tmp8 Tests/out08.txt ; then
    echo "Files are equal!"
    rm tmp8
else
    echo "Files out08.txt and tmp missmatch!"
fi

./a.out < Tests/in09.txt >> tmp9
if cmp -s -- tmp9 Tests/out09.txt ; then
    echo "Files are equal!"
    rm tmp9
else
    echo "Files out09.txt and tmp missmatch!"
fi