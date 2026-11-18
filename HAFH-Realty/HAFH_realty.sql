--- HAFH Realty Company

--- Display the BuildingID, BNoOfFloors, and the manager’s MFName and MLName, for all buildings
SELECT b.BuildingID, b.BNoOfFloors, m.MFName, m.MLName
FROM hafh.building b 
JOIN hafh.manager m 
ON b.BManagerID = m.ManagerID;

--- Display the MFName, MLName, MSalary, MBdate, and the number of buildings that the manager manages, for all managers with a salary less than $60,000

SELECT m.MFName, m.MLName, m.MSalary, m.MBdate, COUNT (*) AS num_of_buildings_managed
FROM hafh.building b 
JOIN hafh.manager m ON b.bmanagerid = m.ManagerID
WHERE m.MSalary < 60000
GROUP BY m.MFName, m.MLName, m.MSalary, m.MBdate ;

--- Display the BuildingID and AptNo, for all apartments leased by the corporate client ‘WindyCT’

SELECT a.BuildingID, a.AptNo
FROM hafh.apartment a
JOIN hafh.corpclient c
ON a.CCID = c.CCID
WHERE c.CCName = 'WindyCT' ;

--- Display the InsID and InsName for all inspectors whose next inspection is scheduled after 1‐JAN‐2014. 
--- Do not display the same information more than once.

SELECT DISTINCT i.InsID, i.InsName
FROM hafh.inspector i  
JOIN hafh.inspecting t
ON i.InsID = t.InsID
WHERE t.DateNext > '2014-01-01' ;

--- Display the SMemberID and SMemberName of staff members cleaning apartments rented by corporate clients whose corporate location is ‘Chicago’
--- Do not display the same information more than once

SELECT DISTINCT s.SMemberID, s.SMemberName
FROM hafh.staffmember s
JOIN hafh.cleaning cl
ON s.SMemberID = cl.SMemberID
JOIN hafh.apartment a
ON cl.BuildingID = a.BuildingID
AND cl.AptNo = a.AptNo
JOIN hafh.corpclient c
ON a.CCID = c.CCID
WHERE c.CCLocation = 'Chicago';

--- Display the CCName of the client and the CCName of the client who referred it, for every client referred by a client in the music industry
SELECT c.CCName AS clientname, r.CCName AS referredby
FROM hafh.corpclient c
JOIN hafh.corpclient r
ON c.CCIDReferredBy = r.CCID
WHERE r.CCIndustry = 'Music' ;

--- Display the BuildingID, AptNo, and ANoOfBedrooms for all apartments that are not leased
SELECT BuildingID, AptNo, ANoOfBedrooms
FROM hafh.apartment
WHERE CCID IS NULL;

