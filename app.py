from flask import Flask
from lxml import etree
import os

app = Flask(__name__)

@app.route('/')
def show_news():
    try:
        # Определяем путь к файлам (важно для Render)
        base_dir = os.path.dirname(os.path.abspath(__file__))
        xml_path = os.path.join(base_dir, 'news.xml')
        xsl_path = os.path.join(base_dir, 'news.xsl')

        xml = etree.parse(xml_path)
        xsl = etree.parse(xsl_path)
        transform = etree.XSLT(xsl)
        result = transform(xml)

        return str(result)
    except Exception as e:
        return f"<h2>Ошибка:</h2><pre>{e}</pre>", 500

# Обязательно для Render
if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=False)