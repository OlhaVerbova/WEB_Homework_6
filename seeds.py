from datetime import datetime, date, timedelta
from faker import Faker
from random import randint
import sqlite3
from pprint import pprint

fake = Faker()

courses = [
    "Mathematics", "World Literature", "World History",
    "Thermodynamics", "Programming", "Microeconomics",
    "General Psychology", "Ecology"
]

groups = [
    "Innovators Alliance", "Global Scholars Network", "Tech Explorers Guild"
]

TEACHERS_NUM = 5
STUDENTS_NUM = 45

connect = sqlite3.connect("hw_6.db")
cursor = connect.cursor()

def seed_teachers():
    teachers = [fake.name() for _ in range(TEACHERS_NUM)] #fakes name of teachers
    sql_instruction = "INSERT INTO teachers(fullname) VALUES(?);"
    cursor.executemany(sql_instruction, zip(teachers,))


def seed_courses():
    
    sql_instruction = "INSERT INTO courses(name, teacher_id) VALUES(?, ?);"
    cursor.executemany(sql_instruction, zip(courses, iter(randint(1, TEACHERS_NUM) for _ in range(len(courses)))))

def seed_groups():
    sql_instruction = "INSERT INTO groups(name) VALUES(?);"
    cursor.executemany(sql_instruction, zip(groups,))

def seed_students():
    students = [fake.name() for _ in range(STUDENTS_NUM)] 
    sql_instruction = "INSERT INTO students(fullname, group_id) VALUES(?, ?);"    
    cursor.executemany(sql_instruction, zip(students, iter(randint(1, len(groups)) for _ in range(len(students)))))

def seed_grades():
    start_of_study = datetime.strptime("2023-09-01", "%Y-%m-%d")
    end_of_study = datetime.strptime("2023-11-25", "%Y-%m-%d")
    sql_instruction = "INSERT INTO grades(courses_id,students_id, grade, date_of) VALUES(?, ?, ?, ?);" 

    def get_list_dete(start: date, end: date):
        date_result = []
        temp_date = start
        while temp_date <= end:
            date_result.append(temp_date)
            temp_date += timedelta(1)
        return date_result 
    
    result_list_date = get_list_dete(start_of_study, end_of_study)

    grades = []
    for day in result_list_date:
        random_courses = randint(1, len(courses))
        random_students = [randint(1, STUDENTS_NUM) for _ in range(7)]
        for student in random_students:
            grades.append((random_courses, student, randint(1,12), day.date()))
    
    cursor.executemany(sql_instruction, grades)
    



if __name__ == "__main__":
    try:
        seed_teachers()
        seed_courses()
        seed_groups()
        seed_students()
        seed_grades()
        connect.commit()
    except sqlite3.Error as err:
        pprint(err)
    finally:
        connect.close()




    


