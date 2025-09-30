# Configuration for the Raspberry PI 500 models

## Install the software

Need to install the software to update the drivers and configure the keyboard

```
sudo apt install rpi-keyboard-config rpi-keyboard-fw-update
```

## Update the firmware

Update the firmware to the latest version

```
sudo rpi-keyboard-fw-update
```

## Make the caps lock key a control key

Turn the caps lock key into a more useful control key

```
sudo rpi-keyboard-config key set 3 0 KC_LEFT_CTRL
```

### Other useful commands as a quick list...

The following are quite useful to get details about key bindings etc:

```
rpi-keyboard-config info
rpi-keyboard-config key get 0 0     # Should be the escape key
rpi-keyboard-config key get 3 0     # Should be the caps lock key
rpi-keyboard-config key get 5 0     # Should be the left control key
```
