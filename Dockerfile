# Python과 Node.js를 모두 사용하는 이미지
#FROM nikolaik/python-nodejs:python3.11-nodejs16
FROM python:3.9-slim
# 작업 디렉토리 설정
WORKDIR /app

# 의존성 파일 복사 (package.json과 requirements.txt)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 나머지 소스 코드 복사
COPY . .

# 애플리케이션 실행 (실제 실행 명령어로 변경 필요)
#CMD ["python", "app.py"]
#CMD gunicorn --bind 0.0.0.0:$PORT app:app
#CMD gunicorn --bind 0.0.0.0:8080 --log-level debug app:app
CMD gunicorn --bind 0.0.0.0:${PORT:-8080} app:app

#아래는 다음을 위해 참조할 내용
#Node.js 애플리케이션인 경우:
#CMD ["npm", "start"] (package.json의 start 스크립트 실행)
#CMD ["node", "app.js"] (직접 app.js 파일 실행)

#Python 애플리케이션인 경우:
#CMD ["python", "app.py"] (Python 스크립트 직접 실행)
#CMD ["gunicorn", "app:app"] (Flask나 Django 앱을 gunicorn으로 실행)

#혼합된 경우:
#CMD ["sh", "-c", "python app.py & npm start"] (Python과 Node.js 앱을 함께 실행)
