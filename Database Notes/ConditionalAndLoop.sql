-- Conditional Statements and Loops

-- IF Statement
IF condition_1 THEN statement_1;
[ELSEIF condition_2 THEN statement_2;]
…
[ELSE statement_n;]
END IF;

-- CASE Statement
CASE expression
    WHEN condition_1 THEN statement_1; -- checking expression to condition
    WHEN condition_2 THEN statement_2;
    WHEN condition_3 THEN statement_3;
    …
    [ELSE statement_n;]
END CASE;

-- WHILE Loop
[label: ] WHILE condition DO
    <loop body;>
END WHILE [label];

-- REPEAT Loop (Do-While Loop)
[label: ] REPEAT
    <loop body;>
    UNTIL condition
END REPEAT [label];

-- Leave & Iterate
LEAVE label; -- used to stop a loop
ITERATE label; -- skipping current iteration

-- Unconditional Loop
[label: ] LOOP
    <loop body;>
    IF condition THEN
        LEAVE label; -- Must have a way inside the code to leave the loop
    END IF;
END LOOP [label];

