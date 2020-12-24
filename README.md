# Setup account
* Register account: `signal-cli -u <phone number> register --voice`<br/>
    Format of `<phone number>` (w/o spaces): `+<country code><phone number>`
* Wait for the phone call to get `<code>`
* Verify account: `signal-cli -u <phone number> verify <code>`<br/>
    Now the key material is stored in the home directory
* Copy config folder for reuse with docker: `cp -R ~/.local/share/signal-cli/ ./docker/signal_config`

# Setup `docker-signal-bot`
* Copy crontab sample: `cp ./docker/crontab.sample ./docker/crontab`
* Configure `./docker/crontab` as required<br/>
    https://crontab.guru/ serves as a small aid
* Build docker container: `docker-compose build --no-cache`
* Start docker container: `docker-compose up`
