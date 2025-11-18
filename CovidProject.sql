SELECT *
FROM CovidProject..CovidDeaths
WHERE continent is not null
order by 3,4



--SELECT *
--FROM CovidProject..CovidVaccinations
--order by 3,4

SELECT location, date, total_cases, new_cases, total_deaths,population
FROM CovidProject..CovidDeaths
ORDER BY 1,2


--The likelihood of dying to COVID in Kenya

SELECT location, date, total_cases, total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
FROM CovidProject..CovidDeaths
WHERE location like '%nya%'
ORDER BY 1,2

--Total Cases vs Population(percentage of people who contracted COVID in Kenya)
SELECT location, date, total_cases, population,(total_cases/population)*100 as KenyaCovidCases
FROM CovidProject..CovidDeaths
WHERE location LIKE '%Kenya'
and continent is not null
ORDER BY 1,2

-- WORLD'S INFECTION RATE COMPARED TO POPULATION
SELECT location,population, MAX(total_cases) as HighestInfectionCount,MAX((total_cases/population))*100 as WorldCovidCases
FROM CovidProject..CovidDeaths
--WHERE location is not null
GROUP BY location, population
ORDER BY WorldCovidCases desc

--Highest Death Count by Country
SELECT location, MAX(CAST(total_deaths as int)) as TotalDeathCount
FROM CovidProject..CovidDeaths
WHERE continent is not null
GROUP BY location
ORDER BY TotalDeathCount desc 


--Highest Death Count by Contitent
SELECT location, MAX(CAST(total_deaths as int)) as TotalDeathCount
FROM CovidProject..CovidDeaths
WHERE continent is  null
GROUP BY location
ORDER BY TotalDeathCount desc 



SELECT continent, MAX(CAST(total_deaths AS int)) as Pop_Deaths
FROM CovidProject..CovidDeaths
WHERE continent is not null
Group by continent
ORDER BY Pop_Deaths DESC


SELECT location, date, total_cases ,total_deaths,(total_deaths/population)*100 as GlobalCovidCases
FROM CovidProject..CovidDeaths
--WHERE location LIKE '%Kenya'
where continent is not null
ORDER BY 1,2 



--GLOBAL NUMBERS

SELECT  SUM(new_cases) as total_cases, SUM(CAST(new_deaths as int)) AS TOTAL_DEATH, SUM(cast(new_deaths as int))/SUM(New_cases)* 100 as DeathPercentage
FROM CovidProject..CovidDeaths
where continent is not null
--group by date
order by 1,2



