export const resultDuplicate = (obj) => {
    const compare = (a, b) => {
        const percentA = a.percent;
        const percentB = b.percent;

        let comparison = 0;
        if (percentA > percentB) {
            comparison = -1;
        } else if (percentA< percentB) {
            comparison = 1;
        }
        console.log(comparison);
        return comparison;
    }


    obj.sort(compare);
    return obj
}

