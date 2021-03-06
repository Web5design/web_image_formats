# This script will build all of the binary encoders and decoders included with
# the test harness, provided you have the required libraries installed at the
# correct locations. Tweaking may be required.

cd encoders
echo "Compiling yuvjpeg..."
gcc yuvjpeg.c -std=c99 -ljpeg -o yuvjpeg || { echo 'Failed!' ; exit 1; }
echo "Compiling yuvjxr..."
gcc yuvjxr.c -I../../jxrlib/jxrtestlib -I../../jxrlib/common/include -I../../jxrlib/jxrgluelib -I../../jxrlib/image/sys -D__ANSI__ -o yuvjxr -L../../jxrlib -ljxrglue -ljpegxr -lm || { echo 'Failed!' ; exit 1; }
echo "Compiling yuvwebp..."
gcc yuvwebp.c -o yuvwebp -std=c99 -I../../libwebp-0.3.1/src/ -L../../libwebp-0.3.1/src/ -lwebp -lm -pthread || { echo 'Failed!' ; exit 1; }
cd ..

cd decoders
echo "Compiling jpegyuv..."
gcc jpegyuv.c -std=c99 -ljpeg -o jpegyuv || { echo 'Failed!' ; exit 1; }
echo "Compiling jxryuv..."
gcc jxryuv.c -o jxryuv -I../../jxrlib/jxrtestlib -I../../jxrlib/common/include -I../../jxrlib/jxrgluelib -I../../jxrlib/image/sys -D__ANSI__ -L../../jxrlib -ljxrglue -ljpegxr -lm || { echo 'Failed!' ; exit 1; }
echo "Compiling webpyuv..."
gcc webpyuv.c -o webpyuv -std=c99 -I../../libwebp-0.3.1/src/ -L../../libwebp-0.3.1/src/ -lwebp -lm -pthread || { echo 'Failed!' ; exit 1; }
cd ..

cd tests/rgbssim
echo "Compiling rgbssim..."
g++ rgbssim.cpp -O2 -o rgbssim -I/usr/include/opencv -I/usr/include/opencv2/highgui -lopencv_core -lopencv_imgproc -lopencv_highgui || { echo 'Failed!' ; exit 1; }
cd ../..

cd tests/dssim
echo "Compiling dssim..."
g++ dssim.cpp -O2 -o dssim -I/usr/include/opencv -I/usr/include/opencv2/highgui -lopencv_core -lopencv_imgproc -lopencv_highgui || { echo 'Failed!' ; exit 1; }
cd ../..

echo "Success building all encoders and decoders."
exit 0
