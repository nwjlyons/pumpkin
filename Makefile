deploy:
	rsync -P index.html neillyons.io:/srv/www/pumpkin.neillyons.io
	rsync -P pumpkin.png neillyons.io:/srv/www/pumpkin.neillyons.io
