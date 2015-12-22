# internetblocker

This project allows any ubuntu or linux computer to block internet access for a specified period of time. This is extremely handy for turning the internet off for a specific user in the evening and re-enabling in the morning.

<h1>Installation</h1>
Download and extract internetblocker-master.zip<br>
<i>cd internetblocker-master<br></i>

Edit cron.d/internetblocker to include the username to block. To block more than one user, copy the cron line and replace the username for each user.<br>

Copy the cron script into cron<br>

<i>sudo cp cron.d/internetblocker /etc/cron.d/internetblocker<br>
sudo chmod 644 /etc/cron.d/internetblocker<br>
sudo chown root:root /etc/cron.d/internetblocker<br>

sudo cp bin/internetblocker.sh /usr/local/bin/internetblocker.sh<br>
sudo chmod 755 /usr/local/bin/internetblocker.sh<br>
sudo chown root:root /usr/local/bin/internetblocker.sh<br></i>
