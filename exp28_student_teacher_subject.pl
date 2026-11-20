% Student, teacher, and subject-code database.
% Query: ?- student_subject(Student, Teacher, Code).

student_subject(asha, mr_rao, cs101).
student_subject(ben, ms_khan, ma102).
student_subject(chloe, mr_rao, cs101).
student_subject(dev, ms_lee, ph103).

student_of(Teacher, Student) :- student_subject(Student, Teacher, _).
students_in_course(Code, Student) :- student_subject(Student, _, Code).
teacher_for_course(Code, Teacher) :- student_subject(_, Teacher, Code).
