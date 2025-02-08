import time
import random
import string


def generate_random_email(domain_size):
    rand_name = str(time.time_ns())
    domain = ''.join(random.choices(string.ascii_letters, k=domain_size))
    rand_email = f"{rand_name}@{domain}.com"
    return rand_name, rand_email


DOMAIN_SIZE = 10
RANDOM_USER, RANDOM_EMAIL = generate_random_email(DOMAIN_SIZE)
