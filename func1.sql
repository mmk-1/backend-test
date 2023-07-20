CREATE OR REPLACE FUNCTION get_spots()
RETURNS TABLE (spot_name varchar, domain varchar, domain_count bigint)
AS $$
BEGIN
    RETURN QUERY
    SELECT q.name, q.domain, COUNT(*) as domain_count
    FROM (
        SELECT name, (regexp_matches(website, '(?:https?://)?(?:www\.)?([^/]+)'))[1]::varchar as domain
        FROM "MY_TABLE"
        WHERE website IS NOT NULL
    ) q
    GROUP BY q.domain, q.name
    HAVING COUNT(*) > 1;
END;
$$ LANGUAGE plpgsql;

