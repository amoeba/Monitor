import SwiftUI

struct SourceRow: View {
    var source: Source
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text(source.name)
                Text(source.address)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            HStack(alignment: .bottom, spacing: 0){
                Text(source.lastPing == nil ? "" : source.lastPing ?? "...")
                    .foregroundColor(getGradeColor(grade: (source.lastPingGrade ?? PingGrade.bad.rawValue) as Int))
                Text(source.lastPingUnit ?? "")
                    .font(.footnote)
                    .foregroundColor(getGradeColor(grade: source.lastPingGrade ?? PingGrade.bad.rawValue as Int))
            }
        }
        .padding(0)
    }
    
    private func getGradeColor(grade: Int) -> Color? {
        if (grade == PingGrade.good.rawValue) {
            return Color.green
        } else if (grade == PingGrade.okay.rawValue) {
            return Color.yellow
        } else {
            return Color.red
        }
    }
}

struct SourceRow_Previews: PreviewProvider {
    static var previews: some View {
        SourceRow(source: ModelData().sources[0])
    }
}
