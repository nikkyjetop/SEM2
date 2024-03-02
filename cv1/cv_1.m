mytime = datetime('now');
minutes = (mytime.Hour * 60) + mytime.Minute + (mytime.Second / 60);
binary_minutes = float2bin(minutes, 10);