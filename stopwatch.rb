# Available methods:
# Stopwatch.new - create new instance of stopwatch
# start - start stopwatch
# stop - stop stopwatch
# result(n) - return float number of miliseconds passed by between start and stop, (optional) round to n decimal places. By defeault n is 20
# result_all(n) - return array of all measurements, (optional) round to n decimal places. By defeault n is 20
# result_average(n) - return average from all measurements, (optional) round to n decimal places. By defeault n is 20

class Stopwatch
    def initialize()
        @results = []
        @start_time = 0.0
        @stop_time = 0.0
        @milis = 0.0
    end
    
    def start()
        @start_time = Time.now.to_f
    end

    def stop()
        @stop_time = Time.now.to_f
        @milis = ((@stop_time-@start_time) * 1000)
        @results.push(@milis)
    end

    def result(decimal_places = 20)
        return @milis.round(decimal_places)
    end

    def results_all(decimal_places=20)
        return @results if decimal_places>=20
        arr = []
        arr.replace(@results)
        for i in 0..arr.size-1
            arr[i]=arr[i].round(decimal_places)
        end
        return arr
    end

    def result_average(decimal_places = 20)
        avr = (@results.sum / @results.size.to_f)
        return avr.round(decimal_places)
    end
end