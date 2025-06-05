from dotenv import load_dotenv
import  os

load_dotenv()

print("USERNAME:", os.getenv("ZEUS_USER"))
print("PASSWORD:", os.getenv("ZEUS_PASSWORD"))
