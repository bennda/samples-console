using System;

namespace dndnt
{
        internal class Parameters
        {
            public string Mode { get; set; } = "echo";
            public string Text { get; set; } = string.Empty;
            public int RandomMin { get; set; } = 0;
            public int RandomMax { get; set; } = 1000;
        }

    internal class Program
    {
        private static int GetRandomInteger(int minimum, int maximum)
        {
            return new Random().Next(minimum, maximum);
        }

        private static Parameters GetParameters(string[] args)
        {
            var @params = new Parameters();
            foreach (var arg in args) {
                if (arg.StartsWith("-m=") || arg.StartsWith("--mode=")) {
                    @params.Mode = arg.Split('=', 2).Last();
                }
                else if (arg.StartsWith("-t=") || arg.StartsWith("--text=")) {
                    @params.Text = arg.Split('=', 2).Last();
                }
                else if (arg.StartsWith("--randmin=")) {
                    @params.RandomMin = Convert.ToInt32(arg.Split('=', 2).Last());
                }
                else if (arg.StartsWith("--randmax=")) {
                    @params.RandomMax = Convert.ToInt32(arg.Split('=', 2).Last());
                }
            }

            return @params;
        }

        static void Main(string[] args)
        {
            var parameters = GetParameters(args);
            
            switch (parameters.Mode.ToLower()) {
                case "echo":
                    Console.WriteLine(parameters.Text);
                    break;
                case "random":
                    Console.WriteLine($"{GetRandomInteger(parameters.RandomMin, parameters.RandomMax)}");
                    break;
                default:
                    throw new Exception("invalid mode");
            }
        }
    }
}