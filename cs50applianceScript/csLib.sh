wget http://mirror.cs50.net/library50/c/library50-c-5.zip
unzip library50-c-5.zip
rm -f library50-c-5.zip
cd library50-c-5
gcc -c -ggdb -std=c11 cs50.c -o cs50.o
ar rcs libcs50.a cs50.o
chmod 0644 cs50.h libcs50.a
sudo mkdir -p /usr/local/include
sudo chmod 0755 /usr/local/include
sudo mv -f cs50.h /usr/local/include
sudo mkdir -p /usr/local/lib
sudo chmod 0755 /usr/local/lib
sudo mv -f libcs50.a /usr/local/lib
cd ..
rm -rf library50-c-5

