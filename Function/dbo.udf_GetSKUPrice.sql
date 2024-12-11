create or alter function dbo.udf_GetSKUPrice(
	@ID_SKU int
)
returns decimal(18, 2)
as
begin
	return cast(
		(select sum(b.Value)/sum(b.Quantity)
		from dbo.Basket as b 
		where b.ID_SKU = @ID_SKU) as decimal(18, 2)
		)
end


