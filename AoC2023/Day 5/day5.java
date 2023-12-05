
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

public class day5 {

    public static void main(String[] args) throws IOException{
        
        BufferedReader file = new BufferedReader(new FileReader("input.txt"));
    
        String seeds = file.readLine().substring("seeds: ".length());
        List<Long> init = Arrays.stream(seeds.split(" ")).map(Long::parseLong).toList();
        List<Garden> maps = new ArrayList<>();
        Garden cur = null;

        while ((seeds = file.readLine()) != null) 
        {
            if (seeds.isEmpty())
            {
                if (cur != null)
                {
                    maps.add(cur);
                }

                seeds = file.readLine();
                cur = new Garden();
            }    
            else
            {
                cur.addMap(seeds.split(" "));
            }
        }
        maps.add(cur);

        long lowest = Long.MAX_VALUE;
        for (Long l : init)
        {
            long res = l;

            for (Garden g : maps)
            {
                res = g.map(res);
            }

            lowest = Math.min(lowest, res);
        }

        System.out.println("p1: " + lowest);

        TreeSet<Range> ranges = new TreeSet<>();
        for (int i = 0; i < init.size() - 1; i += 2) {
            Long start = init.get(i);
            ranges.add(new Range(start, start + init.get(i + 1) - 1));
        }
        mergeRanges(ranges);

        for (Garden gm : maps) {
            ranges = gm.map(ranges);
        }
        System.out.println("p2: " + ranges.getFirst().start);
    }

    private static void mergeRanges(TreeSet<Range> ranges)
    {
        Range prev = null;

        for (Iterator<Range> it = ranges.iterator(); it.hasNext(); )
        {
            Range cur = it.next();

            if (prev == null) 
            {
                prev = cur;
                continue;
            }

            if (prev.overlapAdjacent(cur)) 
            {
                prev.start = Math.min(prev.start, cur.start);
                prev.end = Math.max(prev.end, cur.end);
                it.remove();
            }
            else
            {
                prev = cur;
            }
        }
    }

    private static class Garden {
    
        private List<OneMap> maps = new ArrayList<>();

        public void addMap(String... spec)
        {
            if (spec.length != 3)
            {
                throw new IllegalArgumentException();
            }
            maps.add(new OneMap(Long.parseLong(spec[0]), Long.parseLong(spec[1]), Long.parseLong(spec[2])));
        }

        public long map(long src)
        {
            for (OneMap o : maps)
            {
                Long cand = o.map(src);
                if (cand != null)
                {
                    return cand;
                }
            }
            return src;
        }

        public TreeSet<Range> map(TreeSet<Range> ranges)
        {
            TreeSet<Range> mapped = new TreeSet<>();
            TreeSet<Range> unmapped = ranges;

            for (OneMap o : maps)
            {
                if (unmapped.isEmpty())
                {
                    break;
                }

                TreeSet<Range> step = new TreeSet<>();
                o.map(unmapped, step, mapped);
                unmapped = step;
            }

            mapped.addAll(unmapped);
            mergeRanges(mapped);
            return mapped;
        }

        @Override
        public String toString()
        {
            StringBuilder sb = new StringBuilder();

            for (OneMap m : maps)
            {
                sb.append(m.toString());
                sb.append(" ");
            }
            return sb.toString();
        }

    }


    private static class OneMap {
        
        Range source;
        long targetStart;

        public OneMap(long targetStart, long sourceStart, long length)
        {
            source = new Range(sourceStart, sourceStart + length - 1);
            this.targetStart = targetStart;
        }

        public Long map(long src)
        {
            if(source.contains(src))
            {
                return targetStart + (src - source.start);
            }
            return null;
        }

        public void map(TreeSet<Range> in, TreeSet<Range> unmapped, TreeSet<Range> mapped)
        {
            for (Range r : in)
            {
                if (source.end < r.start || source.start > r.end)
                {
                    unmapped.add(r);
                    continue;
                }

                if (r.start < source.start)
                {
                    unmapped.add(new Range(r.start, source.start - 1));
                }
                if (r.end > source.end)
                {
                    unmapped.add(new Range(source.end + 1, r.end));
                }

                long ms = targetStart + (Math.max(source.start, r.start) - source.start);
                long me = targetStart + (Math.min(source.end, r.end) - source.start);
                mapped.add(new Range(ms, me));
            }
        }

        @Override
        public String toString()
        {
            return "[" + source.start + "-" + source.end + " -> " + targetStart + "...]";
        }

    }


    private static class Range implements Comparable<Range> {
        
        long start, end;

        public Range(long start, long end)
        {
            this.start = start;
            this.end = end;
        }

        public boolean overlapAdjacent(Range bigger)
        {
            return bigger.contains(start) || bigger.contains(end + 1) || contains(bigger.start);
        }

        public boolean contains(long l)
        {
            return l >= start && l <= end;
        }
        
        @Override
        public boolean equals(Object o)
        {
            if (this == o) return true;
            if (!(o instanceof Range range)) return false;

            if (start != range.start) return false;
            return end == range.end;
        }

        @Override
        public int compareTo(Range o)
        {
            long r = start - o.start;
            if (r == 0) 
            {
                r = end - o.end;
            }
            if (r < 0)
            {
                return -1;
            }
            if (r > 0)
            {
                return 1;
            }
            return 0;
        }

        @Override
        public String toString()
        {
            return "(" + start + "-" + end + ")";
        }
    }
}