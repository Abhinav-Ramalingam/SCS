import os

# Opening a file for writing
file_path = "input.txt"
try:
    file = open(file_path, "w")
    print(f"File {file_path} opened successfully for writing.")
except Exception as e:
    print(f"Error opening file: {e}")
    exit(1)

# Pausing execution and waiting for user input
user_input = input("Enter some text to write into the file: ")

# Writing the user input to the file
try:
    file.write(user_input + "\n")
    print("User input written to the file successfully.")
except Exception as e:
    print(f"Error writing to file: {e}")

# Closing the file
try:
    file.close()
    print("File closed successfully.")
except Exception as e:
    print(f"Error closing the file: {e}")
