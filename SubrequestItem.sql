UPDATE SubRequestItem
SET Status = 5
WHERE SubRequestItem_key IN (SELECT s.SubRequestItem_key
       FROM SubRequestItem s
       INNER JOIN RequestItem_SubRequestItem rs
       ON s.SubRequestItem_key = rs.SubRequestItem_key
       AND rs.RequestItem_key = %Auth Step 1.RequestItem_key%
       WHERE s.Status = 6)
       
AND TargetID = (SELECT TOP (1) s.TargetID
       FROM SubRequestItem s
       INNER JOIN RequestItem_SubRequestItem rs
       ON s.SubRequestItem_key = rs.SubRequestItem_key
       AND rs.RequestItem_key = %Auth Step 1.RequestItem_key%
       WHERE s.Status = 6)

UPDATE SubRequestItem
SET Status = 10
WHERE SubRequestItem_key IN (SELECT s.SubRequestItem_key
       FROM SubRequestItem s
       INNER JOIN RequestItem_SubRequestItem rs
       ON s.SubRequestItem_key = rs.SubRequestItem_key
       AND rs.RequestItem_key = %Auth Step 1.RequestItem_key%
       WHERE s.Status = 5)

UPDATE RequestItem
SET Status = 10
WHERE RequestItem_key = %Auth Step 1.RequestItem_key% AND RequestItem_key NOT IN(SELECT ri.RequestItem_key
       FROM RequestItem ri
       INNER JOIN RequestItem_SubRequestItem rs
       ON ri.RequestItem_key = rs.RequestItem_key
       INNER JOIN SubRequestItem sr
       ON sr.SubRequestItem_key = rs.SubRequestItem_key AND rs.RequestItem_key = %Auth Step 1.RequestItem_key%       WHERE sr.Status <> 10)

<where>(&amp;(sAMAccountName=%Auth Step 1.Account Name%)%Custom Macro.SQL.GlobalConfigValues.ConfigValue.Global_SupportStaffAuthRestriction%)</where>
