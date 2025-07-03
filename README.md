# Mail backup

Simple setup to fetch mails from remote IMAP and add them to a local server.

The following awesome projects help to backup your mails

- [docker-mailserver](https://github.com/docker-mailserver/docker-mailserver)
- [roundcube](https://github.com/roundcube/roundcubemail)
- [imapsync](https://github.com/imapsync/imapsync)

## Requirements

Install [Docker](https://www.docker.com/products/docker-desktop/)

## Usage

Clone this repository (will require `git`) or download a ZIP file containing all files from [here](https://github.com/webishdev/mail-backup/archive/refs/heads/main.zip)

- Create a environment file named `.env` in the root folder with the following values
  - `REMOTE_IMAP_SERVER=` the hostname of the remote IMAP server
  - `IMAP_USER=` the user which will be used to copy the mails. It MUST exists on the remote IMAP server, and will be created on the local IMAP server
  - `REMOTE_IMAP_PASSWORD=` the password to login into the remote IMAP
  - `LOCAL_IMAP_PASSWORD=` the password to login into the local IMAP (can be different then the remote one)
- Start the container environment with `./start.sh` (will not start detached and block the terminal)
- In another terminal start `./sync.sh`
- Login into Roundcube at http://localhost:9002/ with the user configured as `IMAP_USER` and the password configured as `LOCAL_IMAP_PASSWORD`
- If necessary the `./backup.data.sh` script can be used to create a backup of the data folder
