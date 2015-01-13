OS X starter repository for
[http://littleosbook.github.io/](http://littleosbook.github.io/)

# Requirements

docker (boot2docker) and fig.sh

# Install

```
boot2docker up
$(boot2docker shellinit)
fig build
```

# Compile

```
./make minios.iso
```

# Run

Create a new VM in VirtualBox (type: other,version:other/unknown).
Do not add a virtual hard drive.
Start.
Choose minios.iso

You should see "Hello world" on the screen (possibly with some other
grey messages).
