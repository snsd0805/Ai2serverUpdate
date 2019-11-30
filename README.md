# Ai2serverUpdate AI2server自動化更新
懶得管這臺server了，所以設定好每半年自動化更新一次。
- getJavaURL.py  自動爬App Engine SDK
- update.sh  自動化下載sourcecode、編譯、call getJavaURL.py更新，並且重啟server服務
