-- THIS IS A TESTING SCRIPT FOR TRACING SUBREQUEST SUBROUTINES FOR AN LDAP INTEGRATED APPLICATION

select SubRequestItem.SubRequestItem_key
from SubRequestItem
inner join RequestItem_SubRequestItem
ON SubRequestItem.SubRequestItem_key = RequestItem_SubRequestItem.SubRequestItem_key
where RequestItem_SubrequestItem.RequestItem_Key = 235
and SubRequestItem.TargetID = 'AD'

select top(1) SubRequestItem.SubRequestItem_key
from SubRequestItem
inner join RequestItem_SubRequestItem
on SubRequestItem.SubRequestItem_key = RequestItem_SubRequestItem.SubRequestItem_key
where RequestItem_SubRequestItem.RequestItem_key = 100
and SubRequestItem.TargetID = 'AD' 
and Status = 10 or Status = 2
order by SubRequestItem_key desc


Select TOP (1)sri.SubRequestItem_key
FROM SubRequestItem sri
INNER JOIN RequestItem_SubRequestItem rsi
ON sri.SubRequestItem_key = rsi.SubRequestItem_key
WHERE rsi.RequestItem_key = %Auth Step 1.RequestItem_key%
AND sri.TargetID = '%TargetId%'
AND sri.Status = 10 OR sri.Status = 2
ORDER BY sri.SubRequestItem_key desc

select coalesce(iteration, 0)
as iteration
from SubRequestItem
Inner Join RequestItem_SubRequestItem
on SubRequestItem.SubRequestItem_key = RequestItem_SubRequestItem.SubRequestItem_key
where RequestItem_SubRequestItem.RequestItem_key = 109
and SubRequestItem.TargetID = 'AD'
and SubRequestItem.Username = 'dduck'

-----------------------------------------------------------------------


-- SQL.SubRequestItem.SubRequestKey.ChangeAction
Select TOP (1)sri.SubRequestItem_key
FROM SubRequestItem sri
INNER JOIN RequestItem_SubRequestItem rsi
ON sri.SubRequestItem_key = rsi.SubRequestItem_key
WHERE rsi.RequestItem_key = %Auth Step 1.RequestItem_key%
AND sri.TargetID = '%TargetId%'
AND sri.Status = 10 OR sri.Status = 2
ORDER BY sri.SubRequestItem_key desc
