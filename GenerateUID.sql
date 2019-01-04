CREATE proc [dbo].[GenUID]

@first NVARCHAR(20),
@last NVARCHAR(20)

as


SET NOCOUNT ON;
declare @uid NVARCHAR(20) = ''

while @uid = '' or EXISTS (select UserName from IdentityMap where UserName = @uid and TargetID = 'AD')
begin

select @uid = SUBSTRING(@last,1,5) + SUBSTRING(@first,1,1)

while LEN(@uid) < 6
begin
	select @uid += '0'
end

select @uid += cast(ROUND(((9 - 1 -1) * RAND() + 1), 0)as NVARCHAR(2))
select @uid += cast(ROUND(((9 - 1 -1) * RAND() + 1), 0)as NVARCHAR(2))

end

select @uid as 'UID'



GO
