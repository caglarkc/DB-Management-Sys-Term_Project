use final_database;

-------------------------------------------------
-- 1) FAMILY
-------------------------------------------------
CREATE TABLE Family (
    FamilyID INT PRIMARY KEY,
    MotherEducationLevel    VARCHAR(100),
    MotherEmploymentStatus  VARCHAR(100),
    MotherSector            VARCHAR(100),
    FatherEducationLevel    VARCHAR(100),
    FatherEmploymentStatus  VARCHAR(100),
    FatherSector            VARCHAR(100),
    NumberOfSiblings        INT
);

-------------------------------------------------
-- 2) HIGHSCHOOL
-------------------------------------------------
CREATE TABLE HighSchool (
    HighSchoolID INT PRIMARY KEY,
    HighSchoolName           VARCHAR(200),
    OtherHighSchoolName      VARCHAR(200),
    HighSchoolCity           VARCHAR(100),
    HighSchoolType           VARCHAR(100),
    HighSchoolDepartment     VARCHAR(100),
    OtherHighSchoolDepartment VARCHAR(100),
    HighSchoolGraduationGrade VARCHAR(50)
);

-------------------------------------------------
-- 3) UNIVERSITY (dictionary of universities)
-------------------------------------------------
CREATE TABLE University (
    UniversityID INT PRIMARY KEY,
    UniversityName  VARCHAR(200),
    UniversityType  VARCHAR(100)
);

-------------------------------------------------
-- 4) APPLICANT
-------------------------------------------------
CREATE TABLE Applicant (
    ApplicantID        INT PRIMARY KEY,
    -- Main applicant attributes
    ApplicationYear        INT,
    EvaluationScore        DECIMAL(5,2),
    Gender                 VARCHAR(10),
    DateOfBirth            DATE,
    PlaceOfBirth           VARCHAR(100),
    ResidenceCity          VARCHAR(100),

    -- Foreign keys
    FamilyID     INT,
    HighSchoolID INT,

    CONSTRAINT FK_Applicant_Family
        FOREIGN KEY (FamilyID) REFERENCES Family(FamilyID),

    CONSTRAINT FK_Applicant_HighSchool
        FOREIGN KEY (HighSchoolID) REFERENCES HighSchool(HighSchoolID)
);

-------------------------------------------------
-- 5) APPLICANTUNIVERSITY (link Applicant <-> University)
-------------------------------------------------
CREATE TABLE ApplicantUniversity (
    ApplicantUniversityID INT PRIMARY KEY,
    ApplicantID           INT NOT NULL,
    UniversityID          INT NOT NULL,

    -- Enrollment details
    Major                               VARCHAR(200),
    UniversityYear                      VARCHAR(50),
    UniversityGPA                       VARCHAR(50),
    GraduatedFromAnotherUniversity      BOOLEAN,
    PreviousUniversity                  VARCHAR(200),

    CONSTRAINT FK_ApplicantUniversity_Applicant
        FOREIGN KEY (ApplicantID) REFERENCES Applicant(ApplicantID),

    CONSTRAINT FK_ApplicantUniversity_University
        FOREIGN KEY (UniversityID) REFERENCES University(UniversityID)
);

-------------------------------------------------
-- 6) SCHOLARSHIP
-------------------------------------------------
CREATE TABLE Scholarship (
    ScholarshipID INT PRIMARY KEY,
    ApplicantID   INT NOT NULL,

    ScholarshipType            VARCHAR(50),
    IsReceivingScholarship     BOOLEAN,
    ScholarshipPercentage      DECIMAL(5,2),
    OtherInstitutionName       VARCHAR(200),
    OtherInstitutionScholarshipAmount DECIMAL(10,2),

    CONSTRAINT FK_Scholarship_Applicant
        FOREIGN KEY (ApplicantID) REFERENCES Applicant(ApplicantID)
);

-------------------------------------------------
-- 7) ACTIVITIES
-------------------------------------------------
CREATE TABLE Activities (
    ActivitiesID INT PRIMARY KEY,
    ApplicantID  INT NOT NULL,

    EntrepreneurshipClubMember BOOLEAN,
    ClubName                  VARCHAR(200),
    ProfessionalSport         BOOLEAN,
    RoleInSport               VARCHAR(200),
    NGO_Member                BOOLEAN,
    NGO_Name                  VARCHAR(200),
    ParticipatedInNGOProject  BOOLEAN,
    EntrepreneurshipExperience BOOLEAN,
    EntrepreneurshipExperienceDetails TEXT,

    CONSTRAINT FK_Activities_Applicant
        FOREIGN KEY (ApplicantID) REFERENCES Applicant(ApplicantID)
);

-------------------------------------------------
-- 8) LANGUAGE
-------------------------------------------------
CREATE TABLE Language (
    LanguageID    INT PRIMARY KEY,
    ApplicantID   INT NOT NULL,

    KnowsEnglish      BOOLEAN,
    EnglishProficiency VARCHAR(50),

    CONSTRAINT FK_Language_Applicant
        FOREIGN KEY (ApplicantID) REFERENCES Applicant(ApplicantID)
);
activities