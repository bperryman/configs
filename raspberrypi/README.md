# Raspberry PI configuration files

This folder contains simple configuration files that help setup the
raspberry pi.

## Keyboard

I don't like _caps lock_ - it's not a key that I find myself using all
that often, but I do use the _control_ key a lot. So let's map the _caps
lock_ key to be a _control_ key, just copy the lxkeymap.cfg to the
.config folder.

```
cp lxkeymap.cfg ~/.config
cp keyboard /etc/default
```

This comes from [here](http://shallowsky.com/blog/linux/raspbian-ctrl-key.html)
