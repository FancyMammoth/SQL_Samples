create procedure [dbo].[sp_TempPass]

@FullString NVARCHAR(200) = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890',
@TempPWD NVARCHAR(50) = '',
@RandNum INT = '',
@i INT = 0,
@MaxLen INT = 10

as

begin
	while DATALENGTH(@TempPWD)/2 < @MaxLen --Datalength must be divided by 2 since values ARE UNICODE
		begin
			set @RandNum = ROUND(((63 - 1 -1) * RAND() + 1), 0)
				set @TempPWD += substring(@FullString, @RandNum, 1)
				set @i += 1
				-- ensures Temporary password meets password policy
				if @i = 4 set @TempPWD += 'Q'
				if @i = 7 set @TempPWD += 'z'
				if @i = 2 set @TempPWD += '3'
				--if @i = 5 set @TempPWD += '!'				
		end	
	--Test Selects	
	select @TempPWD as password
	--select DATALENGTH(@TempPWD)/2 as length
end

GO

