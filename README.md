# internetblocker

This project allows any ubuntu or linux computer to block internet access for a specified period of time. This is extremely handy for turning the internet off for a specific user in the evening and re-enabling in the morning.

<h1>Installation</h1>
Download and extract internetblocker-master.zip 
<i>cd internetblocker-master</i>

Edit cron.d/internetblocker to include the username to block. To block more than one user, copy the cron line and replace the username for each user.
# Copy the cron script into cron
<i>sudo cp cron.d/internetblocker /etc/cron.d/internetblocker
sudo chmod 644 /etc/cron.d/internetblocker
sudo chown root:root /etc/cron.d/internetblocker

sudo cp bin/internetblocker.sh /usr/local/bin/internetblocker.sh
sudo chmod 755 /usr/local/bin/internetblocker.sh
sudo chown root:root /usr/local/bin/internetblocker.sh</i>
