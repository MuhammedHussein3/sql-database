SELECT
    s.user_id
     ,round(if(c.user_id is not null ,count(
                                              case
                                                  when action like 'confirmed' then 1
                                              end
                                      ) / count(c.action),0),2) as confirmation_rate
from Signups s
         left join Confirmations c on s.user_id = c.user_id
group by s.user_id