# python3.9のイメージをダウンロード
FROM python:3.9-buster
ENV PYTHONUNBUFFERED=1

WORKDIR /src

# pipを使ってpoetryをインストール
RUN pip install poetry

# poetryの定義ファイルをコピー
COPY pyproject.toml* poetry.lock* ./

# poetryでライブラリをインストール(pyproject.tomlが既にある場合)
RUN poetry config virtualenvs.in-project true
RUN if [ -f pyproject.toml ]; then poetry install; fi

# uvicorn サーバー立ち上げ
ENTRYPOINT ["poetry", "run", "uvicorn", "api.main:app", "--host", "0.0.0.0", "--reload"]

