#!/usr/bin/env python3

import os
from pathlib import Path
import subprocess
import uuid

site_dir = os.path.dirname(os.path.realpath(__file__))

dest_dir = os.path.join("..", "pollen-publish", "docs")
Path(dest_dir).mkdir(parents=True, exist_ok=True)
process = subprocess.Popen(f'raco pollen render && raco pollen publish {site_dir} {dest_dir}', shell=True, stdout=subprocess.PIPE)
process.wait()

files_to_delete = ['publish.py', 'publish.pyc', 'README.md', 'TEMPLATE-LICENSE.MD']
for file in files_to_delete:
	full_path = os.path.join(dest_dir, file)
	if os.path.exists(full_path):
		os.remove(full_path)

print('Successfully published to ../pollen-publish/docs directory.')
print("Commit and push? (Y/n)")
commit_and_push = input() == "Y"
if commit_and_push:
	git_process = subprocess.Popen('git add . && git commit -m "Publish site updates." && git push', shell=True, cwd=dest_dir)
	git_process.wait()
	print('Successfully pushed to gh-pages branch')


