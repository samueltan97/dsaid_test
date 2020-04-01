from crontab import CronTab
import os

scheduler_cron = CronTab()
job = scheduler_cron.new(command='0 1 * * * python ' + os.getcwd() + '/process_data.py')
scheduler_cron.write()
