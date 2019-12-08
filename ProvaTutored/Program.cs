using System;
using System.Collections.Generic;
using System.Linq;

namespace ProvaTutored
{
    class Program
    {
        static void Main(string[] args)
        {
            //N is the cardinality in the 'source' set.
            string[] source = new[] { "dog", "red", "der", "gdo", "god", "god", "godd", "good", "paternal", "yellow", "parental", "preantal" };

            //O(N) if I assume that the max length of a word is fixed
            IList<Word> words = GetWords(source);

            //close to O(N) because GroupBy has an hash based implementation 
            var output = words.GroupBy(x => x.Sorted);

            //O(N)
            Print(output);

            Console.Read();
        }
        private static IList<Word> GetWords(string[] source)
        {
            IList<Word> words = new List<Word>();
            foreach (string text in source)
            {
                words.Add(new Word()
                {
                    Original = text,
                    Sorted = String.Concat(text.OrderBy(t => t))
                });
            }
            return words;
        }

        private static void Print(IEnumerable<IGrouping<string, Word>> output)
        {
            foreach (IGrouping<string, Word> rowGroup in output)
            {
                Console.WriteLine(String.Join(",", rowGroup.Select(x => x.Original)));
            }
        }     
    }
}
