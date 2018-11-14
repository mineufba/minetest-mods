area_check = {}

area_check.isInside = function (minp1, maxp1, minp2, maxp2)
	
	if (minp1.x < minp2.x or maxp1.x > maxp2.x) then
		return false
	elseif (minp1.y < minp2.y or maxp1.y > maxp2.y) then
		return false
	elseif (minp1.z < minp2.z or maxp1.z > maxp2.z) then
		return false
	end

	return true
end	