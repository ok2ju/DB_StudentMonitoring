drop index ClassUniqueIndex;
create unique index ClassUniqueIndex on Class(id_class, class_number, class_character);

drop index StudentSurnameIndex;
CREATE INDEX StudentSurnameIndex ON Student(person.surname) COMPUTE STATISTICS;

drop index TruancyReasonIndex;
CREATE INDEX TruancyReasonIndex ON Truancy(reason);

drop index SubjecTitleIndex;
CREATE INDEX SubjectTitleIndex ON Subject(title);

drop index ClassNumberIndex;
CREATE INDEX ClassNumberIndex ON Class(class_number);

drop index ClassCharIndex;
CREATE INDEX ClassCharIndex ON Class(class_character);

analyze table Student COMPUTE STATISTICS;