-- CreateTable
CREATE TABLE "Field" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Skill" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "fieldId" INTEGER NOT NULL,
    CONSTRAINT "Skill_fieldId_fkey" FOREIGN KEY ("fieldId") REFERENCES "Field" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "JobType" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Location" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "country" TEXT NOT NULL,
    "building" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Experience" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "locationId" INTEGER NOT NULL,
    "jobTypeId" INTEGER NOT NULL,
    "fieldId" INTEGER NOT NULL,
    "priority" INTEGER NOT NULL,
    "startDate" DATETIME NOT NULL,
    "endDate" DATETIME NOT NULL,
    "link" TEXT NOT NULL,
    CONSTRAINT "Experience_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "Location" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Experience_jobTypeId_fkey" FOREIGN KEY ("jobTypeId") REFERENCES "JobType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Experience_fieldId_fkey" FOREIGN KEY ("fieldId") REFERENCES "Field" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Accomplishment" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "experienceId" INTEGER NOT NULL,
    "experienceType" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "result" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "projectId" INTEGER,
    CONSTRAINT "Accomplishment_experienceId_fkey" FOREIGN KEY ("experienceId") REFERENCES "Experience" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Accomplishment_experienceId_fkey" FOREIGN KEY ("experienceId") REFERENCES "ExternalActivity" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Accomplishment_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SkillsOnAccomplishments" (
    "skillId" INTEGER NOT NULL,
    "accomplishmentId" INTEGER NOT NULL,

    PRIMARY KEY ("skillId", "accomplishmentId"),
    CONSTRAINT "SkillsOnAccomplishments_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skill" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "SkillsOnAccomplishments_accomplishmentId_fkey" FOREIGN KEY ("accomplishmentId") REFERENCES "Accomplishment" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Project" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "locationId" INTEGER NOT NULL,
    "fieldId" INTEGER NOT NULL,
    "priority" INTEGER NOT NULL,
    "startDate" DATETIME NOT NULL,
    "endDate" DATETIME NOT NULL,
    CONSTRAINT "Project_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "Location" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Project_fieldId_fkey" FOREIGN KEY ("fieldId") REFERENCES "Field" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Award" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "awardedDate" DATETIME NOT NULL,
    "description" TEXT NOT NULL,
    "educationId" INTEGER NOT NULL,
    CONSTRAINT "Award_educationId_fkey" FOREIGN KEY ("educationId") REFERENCES "Education" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Achievement" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "issuer" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "educationId" INTEGER NOT NULL,
    CONSTRAINT "Achievement_educationId_fkey" FOREIGN KEY ("educationId") REFERENCES "Education" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Education" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "locationId" INTEGER NOT NULL,
    "fieldId" INTEGER NOT NULL,
    "priority" INTEGER NOT NULL,
    "startDate" DATETIME NOT NULL,
    "endDate" DATETIME NOT NULL,
    CONSTRAINT "Education_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "Location" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Education_fieldId_fkey" FOREIGN KEY ("fieldId") REFERENCES "Field" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ExternalActivity" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "locationId" INTEGER NOT NULL,
    "fieldId" INTEGER NOT NULL,
    "priority" INTEGER NOT NULL,
    "startDate" DATETIME NOT NULL,
    "endDate" DATETIME NOT NULL,
    CONSTRAINT "ExternalActivity_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "Location" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ExternalActivity_fieldId_fkey" FOREIGN KEY ("fieldId") REFERENCES "Field" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Profile" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "website" TEXT NOT NULL,
    "contactNumber" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Email" (
    "email" TEXT NOT NULL,
    "profileId" INTEGER NOT NULL,
    CONSTRAINT "Email_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Hyperlink" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "linkedObjectId" INTEGER NOT NULL,
    "linkedObjectTypeName" TEXT NOT NULL,
    CONSTRAINT "Hyperlink_linkedObjectId_fkey" FOREIGN KEY ("linkedObjectId") REFERENCES "Experience" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Hyperlink_linkedObjectId_fkey" FOREIGN KEY ("linkedObjectId") REFERENCES "ExternalActivity" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Hyperlink_linkedObjectId_fkey" FOREIGN KEY ("linkedObjectId") REFERENCES "Project" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Hyperlink_linkedObjectId_fkey" FOREIGN KEY ("linkedObjectId") REFERENCES "Education" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Hyperlink_linkedObjectId_fkey" FOREIGN KEY ("linkedObjectId") REFERENCES "Profile" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Job" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "fieldId" INTEGER NOT NULL,
    "resumeId" INTEGER NOT NULL,
    CONSTRAINT "Job_fieldId_fkey" FOREIGN KEY ("fieldId") REFERENCES "Field" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Job_resumeId_fkey" FOREIGN KEY ("resumeId") REFERENCES "Resume" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ResumeGroup" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "fieldId" INTEGER NOT NULL,
    CONSTRAINT "ResumeGroup_fieldId_fkey" FOREIGN KEY ("fieldId") REFERENCES "Field" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Resume" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "tag" TEXT NOT NULL,
    "resumeGroupId" INTEGER NOT NULL,
    CONSTRAINT "Resume_resumeGroupId_fkey" FOREIGN KEY ("resumeGroupId") REFERENCES "ResumeGroup" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SubsectionMask" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "tag" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "linkedObjectId" INTEGER NOT NULL,
    "linkedObjectTypeName" TEXT NOT NULL,
    "propertyToChange" TEXT NOT NULL DEFAULT 'description',
    "propertyNewValue" TEXT NOT NULL,
    CONSTRAINT "SubsectionMask_linkedObjectId_fkey" FOREIGN KEY ("linkedObjectId") REFERENCES "Accomplishment" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "SubsectionMask_linkedObjectId_fkey" FOREIGN KEY ("linkedObjectId") REFERENCES "Achievement" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "SubsectionMask_linkedObjectId_fkey" FOREIGN KEY ("linkedObjectId") REFERENCES "Award" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SectionMask" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "tag" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "linkedObjectId" INTEGER NOT NULL,
    "linkedObjectType" TEXT NOT NULL,
    CONSTRAINT "SectionMask_linkedObjectId_fkey" FOREIGN KEY ("linkedObjectId") REFERENCES "Experience" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "SectionMask_linkedObjectId_fkey" FOREIGN KEY ("linkedObjectId") REFERENCES "Project" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "SectionMask_linkedObjectId_fkey" FOREIGN KEY ("linkedObjectId") REFERENCES "Education" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "SectionMask_linkedObjectId_fkey" FOREIGN KEY ("linkedObjectId") REFERENCES "ExternalActivity" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "SectionMask_linkedObjectId_fkey" FOREIGN KEY ("linkedObjectId") REFERENCES "Profile" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SubsectionMaskOnSectionMask" (
    "sectionMaskId" INTEGER NOT NULL,
    "subsectionMaskId" INTEGER NOT NULL,

    PRIMARY KEY ("sectionMaskId", "subsectionMaskId"),
    CONSTRAINT "SubsectionMaskOnSectionMask_sectionMaskId_fkey" FOREIGN KEY ("sectionMaskId") REFERENCES "SectionMask" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "SubsectionMaskOnSectionMask_subsectionMaskId_fkey" FOREIGN KEY ("subsectionMaskId") REFERENCES "SubsectionMask" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SectionMaskOnResume" (
    "sectionMaskId" INTEGER NOT NULL,
    "resumeId" INTEGER NOT NULL,

    PRIMARY KEY ("resumeId", "sectionMaskId"),
    CONSTRAINT "SectionMaskOnResume_sectionMaskId_fkey" FOREIGN KEY ("sectionMaskId") REFERENCES "SectionMask" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "SectionMaskOnResume_resumeId_fkey" FOREIGN KEY ("resumeId") REFERENCES "Resume" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Email_email_key" ON "Email"("email");

-- CreateIndex
CREATE UNIQUE INDEX "ResumeGroup_name_key" ON "ResumeGroup"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Resume_tag_key" ON "Resume"("tag");

-- CreateIndex
CREATE UNIQUE INDEX "SubsectionMask_tag_key" ON "SubsectionMask"("tag");

-- CreateIndex
CREATE UNIQUE INDEX "SectionMask_tag_key" ON "SectionMask"("tag");
