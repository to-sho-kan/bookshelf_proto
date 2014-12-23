filter = angular.module 'bookshelf.filters', []

###
# 蔵書状態フィルター
###
filter.filter 'bookStatus', ->
	return (input) ->
		return '不明' unless input?
		switch input
			when 0 then return '貸出可'
			when 1 then return '貸出中'
			when 2 then return '利用不可'

###
# 蔵書状態フィルター
###
filter.filter 'bookStatusColor', ->
	return (input) ->
		return '' unless input?
		switch input
			when 0 then return 'info'
			when 1 then return 'danger'
			when 2 then return 'warning'
